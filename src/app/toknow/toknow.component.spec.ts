import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToknowComponent } from './toknow.component';

describe('ToknowComponent', () => {
  let component: ToknowComponent;
  let fixture: ComponentFixture<ToknowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToknowComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ToknowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
